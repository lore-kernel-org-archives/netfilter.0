From: Martijn Lievaart <m@rtij.nl>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Wed, 16 Apr 2008 23:56:29 +0200
Message-ID: <4806760D.3040909@rtij.nl>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr> <20080310110209.GB17757@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803111947120.18745@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0803111947120.18745@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: martin f krafft <madduck@madduck.net>, netfilter discussion list <netfilter@vger.kernel.org>

Jan Engelhardt wrote:
> echo "Applying new rules...";
> iptables-restore <new.txt;
> if [ "$?" -ne 0 ]; then
> 	echo "Dude, that failed horribly. (Old rules still intact.)";
> 	exit 1;
> fi

Are you sure? I think it may have committed some tables already and 
errored on another.

M4

