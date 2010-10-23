From: Andrew Beverley <andy@andybev.com>
Subject: Re: Blocking machines by both Mac Address and IP address
Date: Sat, 23 Oct 2010 23:33:54 +0100
Message-ID: <1287873234.1700.330.camel@andybev>
References: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1287873239; bh=SISd9ZiB5oso21xsV88bBWipuzyrznx7meN1x
	J9S8do=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=RpocjDm4
	LEX+Gs638oAaI6LsfqPnDuuZ3gYTGdPymdqf36G4WGOy3gP6sSYeSyJ3ytkpB2AzeJu
	DbYghxtNqGlBy5gWqR7kKEmB5OXMuAsUmWXRK4FYbxrmtjKVE6lOR3oAzEoMhokFYgS
	YYaLVRIbxpViR7y96CeXK//lxHNPY=
In-Reply-To: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Mayo <scotgmayo@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2010-10-23 at 17:19 -0500, Scott Mayo wrote:
> I have my DHCP server setup so that it hands out IP adresses according
> to a machine's Mac address.  Is there a way to deny traffic to the
> internet by both MAC address and IP address?
> 
> i.e.  If MAC address 00:11:22:33:44:55 is given IP address 192.168.0.1
> by DHCP then that should be the only combo that can get to the outside
> world.  If the IP address is changed to something else or if another
> machine that has a different MAC address is given the IP address
> 192.168.0.1 statically, then in neither situation should the machine
> be able to get out to the world.

Something like this...


Set your default policy to drop:

iptables -t mangle -P FORWARD DROP

Then set up a rule for each client that matches both IP address and MAC:

iptables -t mangle -A FORWARD -s 1.2.3.4 \
	-m mac --mac-source aa:aa:aa:aa:aa:aa -j ACCEPT



Andy


