From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: how to stop broadcasts using iptables
Date: Tue, 27 Apr 2004 09:56:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408E74B3.6000906@pbl.ca>
References: <20040427131900.JCWU23570.viefep19-int.chello.at@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040427131900.JCWU23570.viefep19-int.chello.at@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

sschlesi@chello.at wrote:
> my policies are set to -P FORWARD ACCEPT because its just an simple ethernet router, w/o nat and stuff.
> so i thought iptables'll also forward broadcasts from one net to the other.

No.  Netfilter is not going to forward them all-by-itself.  The packet 
will end up in FORWARD chain only if the kernel decides it needs to 
route it from one interface to another.  So, if your kernel is not 
routing broadcast packets (it shouldn't by default), you will not see 
them in FORWARD chain.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

