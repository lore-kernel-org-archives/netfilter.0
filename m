From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internet Servers - DNAT/SNAT
Date: Sun, 9 Jun 2002 17:25:03 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206091625.g59GP4A06543@Networker.rockstone.co.uk>
References: <001f01c20fd0$8aa72820$fb00a8c0@escritoriomundial.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001f01c20fd0$8aa72820$fb00a8c0@escritoriomundial.com.br>
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

On Sunday 09 June 2002 5:13 pm, Roberto Campos wrote:

> Hi,
>
> I'm dealing with nat for the last 3 years but I have never tried to
> SNAT/DNAT.

Fascinating....   If you have not been doing Source NAT, and you have not 
been doing Destination NAT, then what sort of NAT *have* you been doing:-) ?

> We are using SNAT/DNAT to translate the ports 25, 110, 80, 443 and 53
> (UDP and TCP) to the internal IP of the server.
>
> Some problems are occurring:

Please can you post your ruleset so that we can see what you are trying to 
do, and we might be able to tell you what to change.


Antony.

