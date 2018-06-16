//
//  TravelFormViewController.swift
//  viajando
//
//  Created by Lab on 19/05/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit

class TravelFormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var salvar: UIButton!
    @IBOutlet weak var tituloText: UITextField!
    @IBOutlet weak var partidaText: UITextField!
    @IBOutlet weak var chegadaText: UITextField!
    @IBOutlet weak var descricaoText: UITextView!
    var viagemList: [Viagem] = []
    var _rowIndex: Int = -1;
    @IBOutlet weak var enviarFoto: UIButton!
    let imagePicker = UIImagePickerController()
    var imagePickedBlock: ((UIImage) -> Void)?
    @IBOutlet weak var removerViagem: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(self._rowIndex >= 0) {
            self.enviarFoto.alpha = 1
            self.removerViagem.alpha = 1
            tituloText.text = ViagemDados.instancia.viagens[self._rowIndex].titulo
            partidaText.text = ViagemDados.instancia.viagens[self._rowIndex].partida
            chegadaText.text = ViagemDados.instancia.viagens[self._rowIndex].chegada
            descricaoText.text = ViagemDados.instancia.viagens[self._rowIndex].descricao
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func salvarBtn(_ sender: Any) {
        let viagem = Viagem()
        
        if(self._rowIndex >= 0) {
            ViagemDados.instancia.viagens[self._rowIndex].titulo = tituloText.text!
            ViagemDados.instancia.viagens[self._rowIndex].partida = partidaText.text!
            ViagemDados.instancia.viagens[self._rowIndex].chegada = chegadaText.text!
            ViagemDados.instancia.viagens[self._rowIndex].descricao = descricaoText.text!
        }else {
            viagem.titulo = tituloText.text!
            viagem.partida = partidaText.text!
            viagem.chegada = chegadaText.text!
            viagem.descricao = descricaoText.text!
            
            ViagemDados.instancia.viagens.append(viagem)
            
            tituloText.text = ""
            partidaText.text = ""
            chegadaText.text = ""
            descricaoText.text = ""
        }
        
        let mensagem = UIAlertController(title: "Mensagem", message: "Operação realizada com sucesso!", preferredStyle: UIAlertControllerStyle.alert)
        mensagem.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(mensagem, animated: true)
        
    }
    
    @IBAction func enviarFotoGaleria(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imagePickedBlock?(image)
            let foto = Foto()
            foto.origem = image
            FotoDados.instancia.fotos.append(foto)
        }else{
            print("Algo inesperado ocorreu no envio da foto!")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    @IBAction func removerViagemBtn(_ sender: Any) {
        let confirm = UIAlertController(title: "Atenção", message: "Deseja realmente remover?", preferredStyle: UIAlertControllerStyle.alert)
        confirm.addAction(UIAlertAction(title: "Não", style: .cancel, handler: nil))
        confirm.addAction(UIAlertAction(title: "Sim", style: .default, handler: {
            (action: UIAlertAction!) in self.fecharIrHome()
        }))
        self.present(confirm, animated: true)
    }
    
    func fecharIrHome() {
        ViagemDados.instancia.viagens.remove(at: self._rowIndex)
        self.dismiss(animated: true, completion: nil)
    }
}
