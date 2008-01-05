From: Umut Arus <umuta@sabanciuniv.edu>
Subject: Limiting httpd traffic
Date: Sat,  5 Jan 2008 02:25:44 +0200
Message-ID: <20080105022544.99knia1nqesgkw48@webmail.sabanciuniv.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

We want to limiting httpd outgoing traffic in a proxy server, so in  
the scenario, one user should be connects to one web site (one IP) in  
limited connection (for example max. 10).

I don't think that requirement does not meet with --connlimit-above  
parameter. Am I wrong?

Is it possible to type a rule with ipfilter command?

Regards,
