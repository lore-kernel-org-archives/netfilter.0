From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT problem
Date: Thu, 13 Jun 2002 17:03:46 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131604.RAA08174@slate.rockstone.co.uk>
References: <MGEOKCAIJIIHPHKAFOFIAEDLCAAA.tylerk4@sbcglobal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <MGEOKCAIJIIHPHKAFOFIAEDLCAAA.tylerk4@sbcglobal.net>
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

On Thursday 09 May 2002 5:41 am, Tyler Kemp wrote:

> Hey,
> 	I recently installed linux on a spare box I had, in order to share my DSL
> connection throughout the house. I've run into a problem with iptables.
>
> The symptoms:
> 	The linux box connects properly to my DSL service, and can see the windows
> box on the local LAN (windows box can see the linux box aswell). I can
> access services on the linux box such as ssh and http, but something is
> preventing the windows box from seeing anything on the outside world via
> the DSL. Any ideas/solutions?

Yes.   All your rules are in the INPUT chain (except for the stuff labelled 
'syn flood limiting').

The INPUT chain is only for packets going to the firewall itself.

The FORWARD chain is for packets going across the firewall from a machine on 
one side to a machine on the other.

 

Antony.

