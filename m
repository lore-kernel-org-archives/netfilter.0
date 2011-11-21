From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: FORWARD chain in Loop Back interface
Date: Mon, 21 Nov 2011 11:25:52 +0530
Message-ID: <CAGZFCEEyxe-pWwZ8ZzuMV_a_20J_F9txS08aUELx7R3LauCWTw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=oXTUV7lB2VqsgepsjSRPWrDhrylFzGYBWCUo3DgukME=;
        b=fQlYBscQeap7+Ggomx6951qtP55Ply/LbXpJ3/R1QPfLsYjZMaNWNExr7o8Je6h8X8
         7GqKPMLEItHjaRCzDLt/SEqS+VsR/aJPJw16ENEFP/ER2zZonuh2E/jWTjEf9vKnUuCv
         RwFLaReSheehlOBmd/Lhxq2JwePWUZz0nOBlw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>

Hi,

I have a linux laptop.  i have only loop back interface. i have a
small tcp client and tcp server running on the machine  ( simple tcp
echo server and client ).

I would like to log these packets  using   , iptables -A FORWARD -p
tcp -j LOG.  But there is no log getting captured when i execute
client and server ?

is there any way to  produce this  logs ( with only loop back
interface )  in forward chain ?
