From: Filippo Zeus <filippozeus@gmail.com>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Tue, 27 May 2008 03:30:41 +0200
Message-ID: <483B6441.1090005@gmail.com>
References: <483B0E5E.4010209@gmail.com> <483B11DF.3050904@bofhland.org> <483B16F7.2010205@gmail.com> <alpine.LNX.1.10.0805270003570.19084@fbirervta.pbzchgretzou.qr> <483B3A9A.8010001@bofhland.org>
Reply-To: filippozeus@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:disposition-notification-to:date:from:reply-to:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=TXFbP672Ioe0TcIf+Rbc3tHZLS14Ddf7Tr3Zl6aATg0=;
        b=w0YYE7bIfzasu2hMLgr+oMdst5jBP4AVh0jaOd9lttf1RbDQNx1UuchVRHelrom/GdSMQDSMOzVrxU/3rLTj9TmCf9oPegx3+S3BAVQy2cBWK2Q8/sHo/HD0qdZHHpno0k05Tth8D73k9g70tKAS2Jq+49zQiAvC0jjppl2gEeI=
In-Reply-To: <483B3A9A.8010001@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

i do not know, but I'm using filezilla client.
here are logs.
I Hope this helps



Stato:    Risoluzione dell'indirizzo IP in corso per ftp.lifesaver.it
Trace:    ControlSocket.cpp(979):=20
CRealControlSocket::ContinueConnect(0x1650c678) m_pEngine=3D0x154cbd30 =
 =20
caller=3D0x8f7c28
Stato:    Connessione a ***HIDDEN_IP***:21 in corso...
Stato:    Connessione stabilita, in attesa del messaggio di benvenuto..=
=2E
Trace:    CFtpControlSocket::OnReceive()
Risposta:    220 FTP Server ready. Please use FTP-TLS or login will be=20
rejected.
Trace:    CFtpControlSocket::SendNextCommand()
Comando:    AUTH TLS
Trace:    CFtpControlSocket::OnReceive()
Risposta:    234 AUTH TLS successful
Stato:    Inizializzazione TLS in corso...
Trace:    CTlsSocket::Handshake()
Trace:    CFtpControlSocket::SendNextCommand()
Comando:    USER ftp_temp
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    CTlsSocket::Handshake()
Trace:    Handshake successful
Trace:    Cipher: AES-128-CBC, MAC: SHA1
Stato:    Verifica del certificato in corso (checking cert.)...
Stato:    Connessione TLS/SSL established.
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Risposta:    331 Password required for ftp_temp
Trace:    CFtpControlSocket::SendNextCommand()
Comando:    PASS **********
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Risposta:    230 Welcome !
Trace:    CFtpControlSocket::SendNextCommand()
Comando:    PBSZ 0
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Risposta:    200 PBSZ 0 successful
Trace:    CFtpControlSocket::SendNextCommand()
Comando:    PROT P
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Risposta:    200 Protection set to Private
Stato:    Connesso (connected)
Trace:    CFtpControlSocket::ResetOperation(0)
Trace:    CControlSocket::ResetOperation(0)
Stato:    Lettura elenco cartelle... (Reading folders list)
Trace:    CFtpControlSocket::SendNextCommand()
Trace:    CFtpControlSocket::ChangeDirSend()
Comando:    PWD
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Risposta:    257 "/" is the current directory
Trace:    CFtpControlSocket::ResetOperation(0)
Trace:    CControlSocket::ResetOperation(0)
Trace:    CFtpControlSocket::ParseSubcommandResult(0)
Trace:    CFtpControlSocket::ListSubcommandResult()
Trace:    CFtpControlSocket::SendNextCommand()
Trace:    CFtpControlSocket::TransferSend()
Comando:    TYPE I
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Risposta:    200 Type set to I
Trace:    CFtpControlSocket::TransferParseResponse()
Trace:    CFtpControlSocket::SendNextCommand()
Trace:    CFtpControlSocket::TransferSend()
Comando:    PASV
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Trace:    CFtpControlSocket::OnReceive()
Risposta:    227 Entering Passive Mode (77,43,13,50,167,18).
Trace:    CFtpControlSocket::TransferParseResponse()
Trace:    CFtpControlSocket::SendNextCommand()
Trace:    CFtpControlSocket::TransferSend()
Comando:    LIST
Trace:    CFtpControlSocket::OnReceive()
Errore:    Tempo scaduto per la connessione
Trace:    CFtpControlSocket::ResetOperation(2114)
Trace:    CControlSocket::ResetOperation(2114)
Trace:    CFtpControlSocket::ResetOperation(2114)
Trace:    CControlSocket::ResetOperation(2114)
Errore:    Non =E8 stato possibile leggere il contenuto della cartella=20
(can't read folder content)
whiplash ha scritto:
>
> Aren't these extensions used only in FXP?
> --=20
