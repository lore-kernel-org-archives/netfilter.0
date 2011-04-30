From: Andrew Beverley <andy@andybev.com>
Subject: Re: Proxy Filter iptable Settings
Date: Sat, 30 Apr 2011 09:02:55 +0100
Message-ID: <1304150575.1579.15.camel@andybev>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	 <1303885014.18916.10.camel@andybev-desktop>
	 <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
	 <4DB80945.8040304@atc.tcs.com>
	 <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
	 <4DB817A5.3020604@atc.tcs.com>
	 <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
	 <4DB90AE6.9070909@atc.tcs.com>
	 <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1304150582; bh=115n0U0KvjAvQCb+V80sE1wp6kabd8iUzxUCK
	EbDrYc=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=s/plpMGX
	suIVJY6KD2JwmtnKB8RqfsPVxAgYlE9UbvD1MKwM+lhxDGmGIFIZjvOt75VCHHPTDZ3
	LnVrtOVBGaGmomWyTGM/sY269b4u3N9SZlhWc/2qlZBg40U/vIeRtWvEYpfAstz3yV/
	PdEuAHmOgmB7zy+qMGran0r+zvxZ0=
In-Reply-To: <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Hendrie <mike@hendrienet.com>
Cc: Vigneswaran R <vignesh@atc.tcs.com>, netfilter@vger.kernel.org

On Thu, 2011-04-28 at 16:43 -0500, Mike Hendrie wrote:
> All users can get to Google and do searches just fine. I am having
> funny issues with the a couple of application.
> 
> I do not understand why I am having the below issues. Could this be
> because of the iptables?

Probably, although I would say more accurately because of UFW. It's
quite difficult to diagnose problems with automatically generated
iptables rules.

I would say you are better off disabling UFW, and starting with just the
rules you need to get everything working:

# Flush all tables
iptables -t nat -F
iptables -t mangle -F
iptables -t filter -F

# Set the default policy to ACCEPT:
iptables -P PREROUTING ACCEPT
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P POSTROUTING ACCEPT

# Enable packet forwarding:
echo 1 > /proc/sys/net/ipv4/ip_forward

# Setup NAT:
iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE

Once that works, you can then start blocking ports.

> - There is FileMaker application that uses ports 5000 - 5005 to
> connect to an external server that cannot find the external server.
> ??StatefulNAT translation.??

Looking at the following website, you'll need to allow more than just
those ports:

http://sixfriedrice.com/wp/filemaker-firewall/

But, as above, get the firewall working with all ports open, and then
start closing them.

> - There is a yearbook website that uploads photos to an external
> server that does not allow the upload via the webpage. However, I can
> upload the photos if I install the application local to the
> workstation, the vendor had a local installation of the photo upload
> available.

Ditto.

> iptable command used: iptables -t nat -A PREROUTING -i eth1 -p tcp
> --dport 80 -j REDIRECT --to-port 8080

Is this for the proxy? You don't need that rule if you have manually set
the proxy server for each client. That rule *forces* the proxy to be
used.

Andy


