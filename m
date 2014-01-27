From: Scott Mayo <scotgmayo@gmail.com>
Subject: Public IP to Private IP
Date: Mon, 27 Jan 2014 13:22:17 -0600
Message-ID: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=CGaJvbTyFs01K4A7vCOCcQKd/SYtumZ7u4ty8aXChFE=;
        b=MnDZaZqYOQ2mjMtNGH6DAi9NPN9Lss8I4JLBlHk1dm8vzKGEgC/OBy8zJlSBbyRznS
         ZneH6bPK9YGHV2ic7b+rozwPoInb5QzXtg3DBL/r+RNjcaMczZlpgPWJOMDqyAva84Ky
         xBHU218w3VoFf35ITn53c4RNdfBCLpyMNFsFdJ7Ltox5D/jXlhefNVGz41+ZJLzXTOVM
         o+w0datSY259if/hISeYZY8Nnn7cXpOZJyxYhTjg/kT9RWYjuXKqe00jcN5+9kyOvO61
         FuwCVDi/LbDRWmMp1UzgtvSMAzniyAWH6eFWiCdx48Y6ej+FHCuozfjBpb5NdLx+7OLG
         3U8w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am having some troubles getting my public IPs routed to my private IPs.

Here is an example.
Private IP of the main server with my IPTables:  192.168.0.1
Public IP of the main server:  1.1.1.1
I also have 1.1.1.2 and 1.1.1.3 as public IPs attached to the public nic.
Domain name example.org is pointed to 1.1.1.2

I am trying to get the following public IPs to Private IPs:
1.1.1.2 -> 192.168.0.2
1.1.1.3 -> 192.168.0.3

If I am outside my network and go to example.org, it seems to work fine.
If I am inside my network and go to 192.168.0.2 then it works fine.
If I go to example.org from inside my network then it goes back to
192.168.0.1 instead of 192.168.0.2

Maybe this does not have to do with IPTables even since it works with
an IP, but I thought I would ask here.  I do not have an internal DNS
server.

Here are the rules that I have:

IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
--to-destination 192.168.0.2
IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -j SNAT --to-destination 1.1.1.2

Any suggestions would be appreciated.
Thanks.

-- 
Scott Mayo
Mayo's Pioneer Seeds   PH: 573-568-3235   CE: 573-614-2138
