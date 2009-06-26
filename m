From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Fri, 26 Jun 2009 14:57:22 +0200
Message-ID: <4A44C5B2.9030408@trash.net>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

Jorge Bastos wrote:
> Howdy,
> 
> I use a program from my mobile company, to make call's in my PC, this
> program uses SIP for the connection.
> The problem is:
> 
> -When i have these two modules loaded, when the person from the other side
> disconnects, the program doesn't end the call, plus, the call's go down
> very often!!
> -When none of this modules are loaded, everything works as expected when
> the person from the other side disconnects, and no call dies (unless i get
> of my internet connection).
> 
> Any guess? I can work without the modules as i am right now, i just want
> to help if there's something wrong with the modules and help.

Which kernel version are you using? The versions before 2.6.26 are
known not to work properly. With later kernels you might have to
set the sip_direct_media/signalling options to 0.

