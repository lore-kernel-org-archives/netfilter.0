From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Scary Hole in the Firewall?
Date: Mon, 19 Jul 2004 15:01:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FC2891.4080404@pbl.ca>
References: <1090265344.11052.7.camel@dchws.tqmcube.com>	 <40FC242E.3050504@pbl.ca> <1090266741.11052.12.camel@dchws.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090266741.11052.12.camel@dchws.tqmcube.com>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

David Cary Hart wrote:
> On Mon, 2004-07-19 at 15:42, Aleksandar Milivojevic wrote:
>>Question.  Iniside firewall as in "on separate machine inside firewall", 
>>or as in "on the same machine as firewall"?
> 
> -snip-
> 
>>In later case, what you are seeing is what you were supposed to see (if 
>>I'm correct on how snort works, by sniffig network traffic directly from 
>>the network interface).
> 
> Same machine. I think that Snort only sees what gets through the
> firewall.

Actually, if Snort is sniffing traffic directly on the network interface 
(like tcpdump or ethereal), than it will see the packets as they arrive 
on the wire (before Netfilter can filter them out).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

