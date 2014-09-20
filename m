From: Hossein Zabolzadeh <zabolzadeh@gmail.com>
Subject: Iptables Unnown Error
Date: Sat, 20 Sep 2014 15:35:26 +0430
Message-ID: <CAMadfcxmKqxOdTsSHbE_mopB2XECmx4DMfM4G8VJUe9eDYRkfA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=KSz5+rHLwEy+jVD8MKSONhcVxH6rDXP1w2Itr77CXJs=;
        b=ybQebM1vQ+KijavKfyDVRYVdaSzcFWF4offhFZwWDr6w0S9CsT5oDNcRxqwYdphn9P
         22jArTVZnDCRY1vX0IHEN/t0jGtUDmEJ8vNzedgJQGuwwXFpbiWmD2LGDPLxgDUJaU3i
         yGlBsPEusHdd1k+iMOWrLfx6kcFOSnhZzR59LMVYC+6yukwE83B1GtL4RMD+2egzWY+s
         QXDr7qb2E3kyKDazUwjAsGGmAglYtw0/L+T94SoY5rJE11di/gm48S7CX5JO67u8mrKN
         VXnrLmb8Ie4z1B9MUU88G8h5Wm601mP8W7H+zXLtBTfvxCbbCkpkxsJrAigf+XPDOuL+
         EcEg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,
I googled my iptables error, but I couldn't find a way to fix it. The
following error was occured when I executed this command: iptables -t
nat -F

Error:
iptables v1.4.21: cant' initialize iptables table 'nat' : Table does
not exist(do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

My virtual machine is Debian Jessie.
