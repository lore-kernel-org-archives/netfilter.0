From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: ICMP types to allow
Date: Wed, 21 Dec 2005 13:48:48 -0500
Message-ID: <1135190928.31139.37.camel@localhost>
References: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2005-12-21 at 13:36 -0500, Derick Anderson wrote:
> After reading the ICMP state machine section of the Netfilter tutorial
> [http://iptables-tutorial.frozentux.net/iptables-tutorial.html#ICMPCONNE
> CTIONS] it appears that ICMP traffic related to existing TCP and UDP
> connections falls under the RELATED,ESTABLISHED rules.
> 
> So someone correct me if I'm wrong, but this means that any valid ICMP
> error message would get picked up by a '-A FORWARD -m state --state
> RELATED,ESTABLISHED -j ACCEPT' at the start of the chain, and so (as
> lst_hoe01 stated) allowing type 8 is all you really need to do, correct?
> (and a little reading goes a long way... =)
> 
> Thanks,
> 
> Derick Anderson
>  
> 
Somewhere I recall Microsoft documentation asking that all ICMP traffic
be allowed for Active Directory.  I never bothered to find out what
exactly was needed and why.  Does anyone know if a properly functioning
Active Directory needs anything other than echo? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


