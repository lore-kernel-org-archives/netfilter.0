From: pedrocostaarma@sapo.pt
Subject: error with iptables
Date: Thu, 23 Jul 2009 12:32:24 +0100
Message-ID: <20090723123224.10213oznyn3rqslk@w0.mail.sapo.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org


Hello,

I?m Pedro Costa from Portugal and I use Ubuntu 9.04. I have a problem  
when i try to add a new rule to my iptables, that is, i can?t use  
""dport" because the result is everytime "bad argument".

For example, when i try add a new rule like this: " iptables -A INPUT  
-p tcp -i $IF --dport 12345:12346 -j LDROP" have every time this  
error: "Bad argument `12345:12346'".

Please help me.What i have to do ?

waiting awser

Sorry for the bad english

Pedro Costa
Thanks
