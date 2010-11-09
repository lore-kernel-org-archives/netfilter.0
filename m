From: Tommaso Calosi <tcalosi@gmail.com>
Subject: balance traffic between virtual interfaces on the same network
Date: Tue, 9 Nov 2010 14:38:08 +0100
Message-ID: <AANLkTikQ7HBAsiYZDhCZNNTFXUuFxHDFA8sSvN1L1QjO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=evjvIEUjCvxF5avDV+JizlHod1dXI/XDMx/36x773EE=;
        b=DVLB7gxOuFWVPF1m8OBq+EQbFSEqp7VyXJL9PDKbmOiHOeRXJ1kxogmicmTfipjlEv
         OFlwhe86aANOXONXoArkh+lMGATXzb3CTk7L8ZLz/j7rtdZwWYncleRxaraFRXNnBDiE
         kmyKPf/FlGP+qApuaVUMZICuoNzq4aBaIcsY0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

This is my setup:

eth0:1 192.168.1.10/24
eth0:2 192.168.1.20/24
eth0:3 192.168.1.30/24

gateway 192.168.1.1

I know it's a strange question but it's crucial to do this in my setup.
I need to balance traffic between these virtual interfaces so that the
gateway sees the traffic originating from 1.10, 1.20,  and 1.30. Is it
possible?
