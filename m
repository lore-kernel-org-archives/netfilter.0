From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: again problem with alias / virtual interface
Date: Tue, 20 Jul 2004 14:22:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FD70DC.1010002@pbl.ca>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108> <40FC2286.3070005@pbl.ca> <007d01c46dae$0a45f330$eb53623e@x> <40FD6E81.10904@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FD6E81.10904@pbl.ca>
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

Aleksandar Milivojevic wrote:
[snip]
>    -A INPUT -i eth1 -p tcp -d 82.186.92.90 --dport 22 \
>       -m state --state NEW,ESTABLISHED
>    -A OUTPUT -o eth1 -p tcp -s 82.186.92.90 --sport 22 \
>       -m state --state ESTABLISHED
>    -A INPUT -i eth1 -p icmp -d 82.186.92.90 -m state --state RELATED
>    -A OUTPUT -o eth1 -p icmp -s 82.186.92.90 -m state --state RELATED

I forgot "-j ACCEPT" in all of the above.  Sorry for the omission...

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

