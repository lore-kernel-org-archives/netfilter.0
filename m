From: Thomas Elsgaard <thomas.elsgaard@gmail.com>
Subject: -SOLVED- Re: How to do PAT based on source IP adress and port ?
Date: Sun, 18 Jul 2010 02:04:35 -0200
Message-ID: <AANLkTinbM_LPKRts9leJCgEiLAJz154NdjqQrNxPcRiG@mail.gmail.com>
References: <AANLkTik_lOU6fbe13Rh4AQi44CFFaCCGgjT_vR4PEdMg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=5vL/RDB2A8YoDtZqcDOtsh14AdUHlY5OBN0wTeKt19A=;
        b=w+M0FgO8GvdEHsU1W38Ly4/QwgyE3a8MayX8lz/p94D4a41bbYygDLia88gFg5eEo2
         acLZ4imO3ZrNFIBU6UdP27gSAkC1tIbx2YY5c8qB0gVGLr5QWfhwDg9hgZ3raOkESvV6
         yUXhQ7MCQuv/mK333DWz88LvT+HAljBN92vRY=
In-Reply-To: <AANLkTik_lOU6fbe13Rh4AQi44CFFaCCGgjT_vR4PEdMg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sun, Jul 18, 2010 at 1:57 AM, Thomas Elsgaard
<thomas.elsgaard@gmail.com> wrote:
> I am wondering how i can get iptables to do a PAT based on source IP
> address?
> Traffic from 10.5.1.0/24 towards UDP port 69 should be mapped to port
> 20000 instead of port 69
> Traffic from 10.5.2.0/24 towards UDP port 69 should be mapped to port
> 20001 instead of port 69
> Is this possible with iptables?
>
> -----------------------------------------
>
 Hi everybody

 After some work, i managed to get it working...

 The solution was very simple:

 =A0iptables -t nat -A PREROUTING -i eth0 --source 10.5.1.0/24 -p udp -=
-dport
 69 -j REDIRECT --to-port 20001
 iptables -t nat -A PREROUTING -i eth0 --source 10.5.2.0/24 -p udp --dp=
ort 69
 -j REDIRECT --to-port 20002

 Thanks for the advices

 Thomas
