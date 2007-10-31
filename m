From: dhottinger@harrisonburg.k12.va.us
Subject: redirect to webpage
Date: Wed, 31 Oct 2007 11:11:19 -0400
Message-ID: <20071031111119.hc54s7z4e80sc0ws@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I currently block a host of proxifier sites at my firewall using:
$IPC -t nat -A PREROUTING -p tcp -d apchemistry.info -j DROP

Not sure if this is the best practice, but it works fine.  What I  
would like to do, instead of dropping this traffic is have it sent to  
an internal webserver that has our acceptable use policy on it.  Is  
there a REDIRECT command, or what would be the best way to accomplish  
this.  Most of this traffic is actually on port 443, and I cant funnel  
this through my transparent proxy (squid).

thanks,


-- 
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

"rarely do people communicate, they just take turns talking"

