From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables --owner-uid
Date: Sat, 14 Sep 2002 12:22:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020914112228.DMUD13709.mta07-svc.ntlworld.com@there>
References: <39778BFB9C25BA429794B15B50AEC781045422@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39778BFB9C25BA429794B15B50AEC781045422@server-dcms>
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

On Saturday 14 September 2002 11:36 am, Didier Hung Wan Luk wrote:

> Hello All,
>
> I have a question about iptables with the --owner-uid option..
>
> Is it possible to create rules with iptables based on users?
>
> i.e can I say that user marry(uid=513) can telnet out but user
> John(uid=601) cannot?

Only if those users are telnetting out from your firewall machine (which 
implies they have accounts on it, and are logged in to it, which is not a 
recommended arrangement for a firewall).

> In the iptables man it is said that --owner-? (owner module) can match
> characteristics of locally-generated packets only.. if this is the case
> then I cannot use it in an environment where all my clients are windows
> clients and the server is a Samba PDC with iptables. Am I right? Or is
> there another way to do this?

You are correct.   --owner-uid only knows about the locally-owning process, 
therefore there is no meaningful owner match for forwarded packets.

There may be some way you can get Samba to link user ID to IP address, and 
then from there generate some netfilter rules to restrict what each user can 
do ?

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

