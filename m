From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables --owner-uid
Date: Sat, 14 Sep 2002 14:05:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020914130544.GDKM13709.mta07-svc.ntlworld.com@there>
References: <39778BFB9C25BA429794B15B50AEC781045424@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39778BFB9C25BA429794B15B50AEC781045424@server-dcms>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Saturday 14 September 2002 12:53 pm, Didier Hung Wan Luk wrote:

> I may be wrong but I am in confusion here..
> If I am using Samba as a PDC and all my win clients are members of the
> samba domain... are they not using the uid given by Samba? Which is itself
> mapped to a unix user (id) then if this is the case it should work is it
> not..??

Are the packets which you are trying to filter created on the machine running 
netfilter, or are they created on the client (Windows) machine and then 
forwarded through the machine running netfilter ?

If they are generated on the Windows client, you cannot match by user ID.

If they are generated on the machine running netfilter, then you may be able 
to - try it and see.

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

