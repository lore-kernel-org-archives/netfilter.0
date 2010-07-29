From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: block network access for certain users/groups
Date: Thu, 29 Jul 2010 22:33:05 +0300
Message-ID: <4C51D771.1080904@gmail.com>
References: <op.vgmcupy42qajpl@imac.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Aa7PZX/U2xDGf+De2oWMvjejzDWfESD6ED7fwQeOOco=;
        b=kY9rWSJGmPYp0eMMS2j7sr3i7gk90QD66iqWyUxI/WKv30fNau/GPxR4i85loR4b1I
         qLObJLqJzlKaYUqLJb6XlIAp65+5XLb60TmFKsHiXVwJZ5CL4rJwHg2nbmd48WQK4e5p
         F9pA+NNLeA9PnkDU3Yqvqgc3gN82FjDISrtTk=
In-Reply-To: <op.vgmcupy42qajpl@imac.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Elmar Stellnberger <estellnb@gmail.com>
Cc: netfilter@vger.kernel.org

On 7/29/10 10:09 PM, Elmar Stellnberger wrote:
> iptables -A mychain -m owner --gid-owner blockedusergroup -j DROP

For starters, consider using the REJECT target instead of DROP if for no 
other reason than that it will make your engineering easier:

	http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject

	http://www.chrisbrenton.org/2009/07/why-firewall-reject-rules-are-better-than-firewall-drop-rules/


> What will I have to do to implement network access restrictions on a per
> user/group basis?

Follow your chains in sequence and make sure that the packets going to 
or from that group have only one way to go.  If the packets are getting 
through, then there is some chain or rule allowing them through before 
the packet gets to the --gid-owner rule you have above.

/Lars
