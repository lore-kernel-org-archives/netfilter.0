From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Proxy Filter iptable Settings
Date: Sat, 30 Apr 2011 14:24:11 -0500
Message-ID: <20110430192411.GQ2976@cardinal>
References: <4DB817A5.3020604@atc.tcs.com>
 <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
 <4DB90AE6.9070909@atc.tcs.com>
 <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
 <1304150575.1579.15.camel@andybev>
 <20110430165041.GN2976@cardinal>
 <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
 <20110430190257.572819zc1kr5bkr5@www.simplelists.com>
 <BANLkTikQVte5hCN5cFua43R6h8iqaPni3w@mail.gmail.com>
 <1304190535.2488.13.camel@andybev>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1304190535.2488.13.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Apr 30, 2011 at 08:08:55PM +0100, Andrew Beverley wrote:
> On Sat, 2011-04-30 at 13:23 -0500, Mike Hendrie wrote:
> > Now to lock it down? I should just create rules to block ports?
> 
> Well it depends how paranoid you are. You might just want to block 
> new incoming connections to the local network:
> 
> iptables -P FORWARD DROP
> iptables -A FORWARD -i $ext_IF -o $int_IF \
> 	-m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i $int_IF -o $ext_IF -j ACCEPT
> 
> You'd probably also want to drop all incoming connections to the 
> server apart from your web server:
> 
> iptables -A INPUT -p tcp --dport 80 -i $ext_IF -j ACCEPT
> iptables -A INPUT -i $ext_IF -j DROP
> 
> As Rob says though, you're probably best going through a few basic
> tutorials first - you'll be up to speed in no time. Also check out
> iptables-save and iptables-restore.
> 
> Let's hope I haven't made any more mistakes that Rob is going to 
> spot :)

Hehe ... well ... I would suggest that you look at the enhanced 
feature set of -m conntrack --ctstate vs. -m state --state. That's 
not a mistake, though; that is preference. :)
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
