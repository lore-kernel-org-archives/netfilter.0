From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Mon, 17 Jun 2002 21:20:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206172020.g5HKKxA20479@Networker.rockstone.co.uk>
References: <002301c2163a$59175210$8147370a@washingtghv9lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002301c2163a$59175210$8147370a@washingtghv9lt>
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

On Monday 17 June 2002 9:05 pm, James Mello wrote:

> Hrm... This did fix the problem, but I'm still not sure why the heck
> connections other than those from localhost did work. Any ideas?

Yes.   Your original ruleset allowed packets into the INPUT chain if they 
were to destination port 22, and allowed all packets out of the OUTPUT chain.

A remote client connecting by SSH will connect to port 22 through the INPUT 
chain (allowed) and the reply packets go out of the OUTPUT chain (allowed).   
All further packets in the session continue coming in on port 22 (allowed) 
and going out through the OUTPUT chain (allowed).   Therefore the remote 
client works.

The local client, though, connects to port 22 (allowed) and then the server 
tries to reply to the client (also on the local machine) on port 32783 (or 
whatever), and this has to go out through the OUTPUT chain and back in again 
on the INPUT chain - which was not allowed, therefore the local connection 
failed.

 

Antony.

