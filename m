From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Scary Hole in the Firewall?
Date: Mon, 19 Jul 2004 14:42:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FC242E.3050504@pbl.ca>
References: <1090265344.11052.7.camel@dchws.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090265344.11052.7.camel@dchws.tqmcube.com>
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
To: NetFilter List <netfilter@lists.netfilter.org>

David Cary Hart wrote:
> Platform = Fedora 2
> IPTables firewall. Snort running inside the firewall.

Question.  Iniside firewall as in "on separate machine inside firewall", 
or as in "on the same machine as firewall"?

In former case, it might as well be that the packet you are seeing had 
spoofed IP address, and that it originated inside your network.  Is eth0 
on your LAN or outside.  Another case could be that you have ommision in 
firewall rules (so that "what is logged is not always dropped").

In later case, what you are seeing is what you were supposed to see (if 
I'm correct on how snort works, by sniffig network traffic directly from 
the network interface).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

