From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: mac filtering
Date: Wed, 21 Apr 2010 09:25:05 +0530
Message-ID: <l2wcfeab66d1004202055jab9b6853ue6b9e80d5da93dc0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=JdW4fJplxXEjoNcIFiGXXNKAP/QVoPs6A5hp0XmT/vE=;
        b=B2bsZvhaeilVTir3km7cf3RScZ++mfBd4CiPokESjQONJZDggbB16Eh4zh75sPCp8P
         H0Fzc8rm2mGS27Xdy0hP9uYcmYMnP08NWSrf0AJR4RspSV/lsYND1X5Yo4Mfyf8ViGtt
         8vFPQMNJYHYJJkumN5WSrmMmNz5I9VOH3Sdsk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a client machine (say A ) connectected to a linux router . I
can browse internet without any problem .

In router , i can configure  MAC address filters . If i configure A's
mac address should be disabled , A cannot access Router itself ? .

Question : What exactly mac address filter mean ?  disabling router
access or disabling internet access ?


Thanks,
Ratheesh
