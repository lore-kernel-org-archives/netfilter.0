From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Question
Date: Sat, 22 Jun 2002 00:12:28 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621231230.XKAD19225.mta07-svc.ntlworld.com@there>
References: <000401c21951$dcd11310$8147370a@washingtghv9lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000401c21951$dcd11310$8147370a@washingtghv9lt>
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

On Friday 21 June 2002 7:31 pm, James Mello wrote:

> > Also I'm wondering say if I have a dmz and allow people to come into a
> > server on port 80, will netfilter inspect the packet on all 7 layers
> > of the OSI model and make sure that it is actually a http packet and
> > following the rules and protocol specifications of http?
>
> No, but there are experimental modules that will allow you to enforce
> your own rules. I've heard of some IDS or attack detection capabilities
> being done through IP tables.

What sort of modules ?   I *hope* you don't mean the 'string' match ?

I'm not aware of anything based on IPtables which makes an effective (OSI 
layer 7) IDS - it's just not designed for it, being a packet filter.....

 

Antony.

