From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hi guys passive firewall
Date: Sun, 7 Jul 2002 09:06:07 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707080609.TFPL23840.mta03-svc.ntlworld.com@there>
References: <3D27B365.2050705@remo.ws>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D27B365.2050705@remo.ws>
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

On Sunday 07 July 2002 4:20 am, Remo Mattei wrote:

> I have an office with 64 ips which are all valid. I have some server
> that do not need any security enable.

Oh yeah ?   What kind of servers are those, then ?   How come they're not 
vulnerable to anything and therefore don't need any security :-) ?

> But I do have other that I will
> have to firewall down any suggestions? Will all rules come in into the
> input chains and then forward all other packages work.

Depends whether you're talking about putting netfilter onto the server itself 
(in which case you filter the INPUT chain), or whether netfilter is on a 
router between the servers and the Internet (in which case you filter the 
FORWARD chain).

 

Antony.

