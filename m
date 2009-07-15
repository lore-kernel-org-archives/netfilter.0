From: Andrew Kolt <andrew_kolt@darkarts.no-ip.org>
Subject: state ESTABLISHED, RELATED
Date: Wed, 15 Jul 2009 23:25:39 +0300
Message-ID: <4A5E3B43.4050408@darkarts.no-ip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello everybody. I lately found my kernel logfile to be flooded with 
connections that seemed to have no meaning.
They did until a couple of days ago when, while running nmap on a 
computer on my network, i 'tailed' the logfile and discovered they were 
replies from the target computer to my request.

As a temp solution i added the following to the INPUT chain, in order to 
let those replies in:

-A INPUT -i eth0 -p tcp -s 0/0 -d zzz.zzz.zzz.zzz -m state --state 
ESTABLISHED,RELATED -j ACCEPT

Everything works well now, but i'd like to know if there's any other way 
to go about this and if the line above is "good" practice as far
as security goes.

with regards,
Andrew



