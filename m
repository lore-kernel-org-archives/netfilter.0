From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Tue, 9 Jul 2002 14:41:59 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709144159.A25806@spawar.navy.mil>
References: <F1442JB1ndcx3Vp20N30000b94a@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <F1442JB1ndcx3Vp20N30000b94a@hotmail.com>; from davis_compz@hotmail.com on Tue, Jul 09, 2002 at 07:43:42PM +0000
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: j davis <davis_compz@hotmail.com>
Cc: netfilter@lists.samba.org

I read somewhere that ipchains is not stateful so I agree
but yet.. then it would seem that ipchains would have
the problem associated with this thread then!

(i.e. you could not do DNS, HTTP, SMTP, etc. from private
LAN with an ipchains SSH-only Firewall!?!?!?!?)

Chris

On Tue, Jul 09, 2002 at 07:43:42PM +0000, j davis wrote:
> 
> ipchains is not stateful so it doesnt need contrak...right?
> jd
> 
> >From: Christian Seberino <seberino@spawar.navy.mil>
> >To: Patrick Schaaf <bof@bof.de>
> >CC: netfilter@lists.samba.org
> >Subject: Re: how is this stuff getting thru default deny iptables 
> >firewall?....
> >Date: Tue, 9 Jul 2002 12:08:52 -0700
> >MIME-Version: 1.0
> >Received: from [198.186.203.85] by hotmail.com (3.2) with ESMTP id 
> >MHotMailBEF485390058400431CEC6BACB5599E90; Tue, 09 Jul 2002 12:32:25 -0700
> >Received: from va.samba.org (localhost [127.0.0.1])by lists.samba.org 
> >(Postfix) with ESMTPid BD14F424A; Tue,  9 Jul 2002 12:32:11 -0700 (PDT)
> >Received: from dt092n42.san.rr.com (dt092n42.san.rr.com [204.210.48.66])by 
> >lists.samba.org (Postfix) with ESMTP id 8B4534A48for 
> ><netfilter@lists.samba.org>; Tue,  9 Jul 2002 12:07:26 -0700 (PDT)
> >Received: from seberino by dt092n42.san.rr.com with local (Exim 3.32 #1)id 
> >17S0M0-0006ST-00; Tue, 09 Jul 2002 12:08:52 -0700
> >From netfilter-admin@lists.samba.org Tue, 09 Jul 2002 12:33:44 -0700
> >Delivered-To: netfilter@lists.samba.org
> >Message-ID: <20020709120852.A24804@spawar.navy.mil>
> >References: <20020622103055.B32585@spawar.navy.mil> 
> ><20020622173842.AGM19225.mta07-svc.ntlworld.com@there> 
> ><20020623001302.A949@spawar.navy.mil> <20020623095351.M5183@oknodo.bof.de> 
> ><20020627002144.B13910@spawar.navy.mil> 
> ><20020627093730.C1873@oknodo.bof.de>
> >User-Agent: Mutt/1.2.5i
> >In-Reply-To: <20020627093730.C1873@oknodo.bof.de>; from bof@bof.de on Thu, 
> >Jun 27, 2002 at 09:37:30AM +0200
> >Sender: netfilter-admin@lists.samba.org
> >Errors-To: netfilter-admin@lists.samba.org
> >X-BeenThere: netfilter@lists.samba.org
> >X-Mailman-Version: 2.0.8
> >Precedence: bulk
> >List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
> >List-Post: <mailto:netfilter@lists.samba.org>
> >List-Subscribe: 
> ><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=subscribe>
> >List-Id: netfilter user discussion list <netfilter.lists.samba.org>
> >List-Unsubscribe: 
> ><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
> >List-Archive: <http://lists.samba.org/pipermail/netfilter/>
> >
> > > On the other hand, if there is not yet a conntrack record in existence
> > > for the packet, the nat PREROUTING table is consulted
> >
> >Patrick
> >
> >I appreciate all your help and after thinking about this on my vacation
> >last week I think I got it now thanks to your feedback!
> >Can I ask you few questions to verify I got what you said regarding
> >how a private LAN can use DNS, HTTP, SMTP, etc. thru an SSH-only 
> >firewall?...
> >
> >My main confusion I believe was that packets associated with preexisting
> >conntracks are handled differently than packets *not* associated
> >with a previous conntrack.
> >
> >Q1: The conntrack is the "memory" of netfilter that allows it to make
> >decisions based on "history" of PC traffic right?
> >
> >Q2: Packets with a previous associated conntrack are handled *differently* 
> >than ones
> >without previous conntrack... and any attempt to try to understand
> >behavior of firewall *without* this concept is doomed
> >to confusion right?
> >
> >Q3: Is conntrack a new "iptables only" feature? I imagine ancient 
> >ipchains/ipfwadmin
> >would have had same issues and therefore would need something like
> >"conntrack" to work correctly right?
> >
> >Sincerely,
> >
> >Chris
> >--
> >_______________________________________
> >
> >Dr. Christian Seberino
> >SPAWAR Systems Center San Diego
> >Code 2363
> >53560 Hull Street
> >San Diego, CA 92152-5001
> >U.S.A.
> >
> >Phone: (619) 553-7940
> >Fax:   (619) 553-2836
> >Email: seberino@spawar.navy.mil
> >_______________________________________
> >
> 
> 
> thanks,
> jd
> 
> jd@taproot.bz
> http://www.taproot.bz
> 
> _________________________________________________________________
> MSN Photos is the easiest way to share and print your photos: 
> http://photos.msn.com/support/worldwide.aspx
> 

-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2363
53560 Hull Street
San Diego, CA 92152-5001
U.S.A.

Phone: (619) 553-7940
Fax:   (619) 553-2836
Email: seberino@spawar.navy.mil
_______________________________________

