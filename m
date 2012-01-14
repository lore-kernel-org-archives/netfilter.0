From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Dual WAN set-up
Date: Fri, 13 Jan 2012 20:27:16 -0600
Message-ID: <op.v71yfq0xx1lyi3@debiandesk2.net>
References: <201201121651.18887.dyioulos@onpointfc.com>
 <op.v700m6kzx1lyi3@debiandesk2.net>
 <201201131017.22019.dyioulos@onpointfc.com>
 <201201131022.05220.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201201131022.05220.dyioulos@onpointfc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dimitri Yioulos <dyioulos@onpointfc.com>

On Fri, 13 Jan 2012 09:22:04 -0600, Dimitri Yioulos <dyioulos@onpointfc.com> wrote:

> Er, sorry, seems like I don't even remember my own network scheme.
> internal LAN addresses are 192.168.100.0/22, and internal DMZ
> addresses are 192.168.1.0/24.  (The 10.x.x.x addresses are used
> by our VPN.)

Again, I think you will have to use connection marking/mark restore as I detailed in a previous post.  I don't believe that "ip rule add from x.x.x.x fwmark 1" will work when nat is used.  Andy or another of the experts here may have comments on this.  Otherwise, I think you can go ahead and try implementing your multi-uplink firewall based on the advice Andy and I have offered.

-- 
Lloyd
