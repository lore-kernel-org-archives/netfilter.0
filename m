From: Andrew Beverley <andy@andybev.com>
Subject: Re: Proxy Filter iptable Settings
Date: Sat, 30 Apr 2011 20:08:55 +0100
Message-ID: <1304190535.2488.13.camel@andybev>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	 <1303885014.18916.10.camel@andybev-desktop>
	 <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
	 <4DB80945.8040304@atc.tcs.com>
	 <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
	 <4DB817A5.3020604@atc.tcs.com>
	 <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
	 <4DB90AE6.9070909@atc.tcs.com>
	 <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
	 <1304150575.1579.15.camel@andybev> <20110430165041.GN2976@cardinal>
	 <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
	 <20110430190257.572819zc1kr5bkr5@www.simplelists.com>
	 <BANLkTikQVte5hCN5cFua43R6h8iqaPni3w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1304190539; bh=iWgKyq4wHTBHroDc+TH7LhdDh/cYZoe+oQUB/
	GIWOjw=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=MbJtwlfb
	AkplAgKeWpCUF+iUdKBC4omj27ELLpzGmCqDET/gKgTsjwwMEI/emKc2ZUq/mcJN9y5
	bFs07UfJraxZvDywI+ewGFbiJra/Hm1vwr0hSbh3Jd4iippDle+S6de9gpqN2lCX6cS
	hcl3LkysoryeL7qe5d0qwTjI+pUkg=
In-Reply-To: <BANLkTikQVte5hCN5cFua43R6h8iqaPni3w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Hendrie <mike@hendrienet.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-04-30 at 13:23 -0500, Mike Hendrie wrote:
> Thank you, it worked!
> 

Okay, so you didn't top post, but please leave a bit of message so that
it makes sense to anyone joining the conversation <sigh>

> Now to lock it down? I should just create rules to block ports?
> 

Well it depends how paranoid you are. You might just want to block new
incoming connections to the local network:

iptables -P FORWARD DROP
iptables -A FORWARD -i $ext_IF -o $int_IF \
	-m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $int_IF -o $ext_IF -j ACCEPT

You'd probably also want to drop all incoming connections to the server
apart from your web server:

iptables -A INPUT -p tcp --dport 80 -i $ext_IF -j ACCEPT
iptables -A INPUT -i $ext_IF -j DROP

As Rob says though, you're probably best going through a few basic
tutorials first - you'll be up to speed in no time. Also check out
iptables-save and iptables-restore.

Let's hope I haven't made any more mistakes that Rob is going to spot :)

Andy


