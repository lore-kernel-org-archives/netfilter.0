From: Jason Cosby <sky_jason@yahoo.com>
Subject: IPMARK
Date: Thu, 18 Sep 2008 18:34:00 -0700 (PDT)
Message-ID: <368664.7108.qm@web37305.mail.mud.yahoo.com>
Reply-To: sky_jason@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thanks for the responses. I've studied Wondershaper, the LARTC, and ADSL-optimizer. There are lots of great ideas in there for TOS bandwidth division (also important), but, AFAIK, FairNAT is the only one focused on per user bandwidth division. 

Currently, I've got the user mark derived from the last part of the IP address * 10. It would save a lot of work and scripting using IPMARK, and I was getting errors out of MARK that I never figured out (might be the lack of using hex). Right now, I also have to specify the IPs in the script. I was hoping that using IPMARK would eliminate this as well--i.e. whatever IP comes along is checked against allowed MACs and auto assigned a user mark without me having to worry about it.

I'm also not clear on and'ing the user mark with the TOS mark after I get a basic per user bandwidth division going on and am iplementing TOS marking. 

Thanks,
Jason 
