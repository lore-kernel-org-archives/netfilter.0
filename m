From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 19:36:08 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627183611.FWPM16050.mta01-svc.ntlworld.com@there>
References: <20020627182753.GS31466@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627182753.GS31466@cannon.eng.us.uu.net>
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
To: netfilter@lists.samba.org

On Thursday 27 June 2002 7:27 pm, Ramin Alidousti wrote:

> Hi,
>
> Does anyone have a good solution to catch the third (ACK) packet
> in a tcp connection setup?

What do you mean by 'catch' it ?

I mean, I could say "wait till you see a SYN/ACK, and then grab the next 
one", or "look for a SYN, and then take the next one in the same direction", 
but I'm thinking that neither of those is probably the answer you want ?

Tell us what you want to do with the packet and it might make the question a 
little easier.

 

Antony.

