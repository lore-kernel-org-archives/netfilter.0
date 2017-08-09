From: Marc Neudorfer <marc.neudorfer@herzog-systems.de>
Subject: nft and sip with debian 9 stretch
Date: Wed, 9 Aug 2017 12:36:46 +0200
Message-ID: <b4d31d0b-9f15-9b2a-0804-6ad6fd827cb9@herzog-systems.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

i am currently using Debian 9 (nft 0.7, kernel 4.9).
I tried to use nft as primary firewall for my network, but there are a 
lot of problems with our sip/voip phones (phones are ringing, no voice 
-> ct-problem)
The wiki says, the ct-helpers are only available with nft 0.8 and kernel 
4.12.
Is there any known method to get sip-phones to work with nft 0.7? Or 
some kind of workaround?

Kind regards,
Marc


