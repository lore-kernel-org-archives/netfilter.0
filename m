From: Anupam <anupamg@iitk.ac.in>
Subject: Re: Packet sniffing... sort of
Date: Sun, 11 Apr 2004 07:14:16 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4078A2F0.20900@iitk.ac.in>
References: <200404110154.39209.Antony@Soft-Solutions.co.uk>
Reply-To: anupam.gupta@unix.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404110154.39209.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

Antony Stone wrote:
> Hi people.
> 
> This is not strictly a netfilter question, but I'm wondering if maybe someone 
> can help or make a suggestion?
> 
> I want to pick up a packet stream, but for an HTTPS connection, and using a 
> standard packet sniffer like ethereal just gives me the encrypted SSLv3 
> stuff, not the plaintext data which I need to see.



Antony,

Congratulations, you got it right in first guess. This, certainly, is 
not netfilter related question.

Now, a simple string like, "SSL man in the middle attack" on Google will 
give you what you desire.

All the best,
Anupam


