From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Where does linux kernel ipsec hook in
Date: Thu, 21 Oct 2004 08:06:54 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4177B46E.4030209@pbl.ca>
References: <20683.194.211.242.140.1098271907.squirrel@194.211.242.140>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20683.194.211.242.140.1098271907.squirrel@194.211.242.140>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Johannes Kleimola <johannes@kleimola.fi>
Cc: netfilter@lists.netfilter.org

Johannes Kleimola wrote:
>   1) linux 2.6 kernel ipsec (encrypt and decrypt) and

I remember seeing answer to this one on the list a while ago, check the 
list archives.  Vaugly remeber that it goes through the Netrilter twice 
(encrypted, and than unencrypted).  But don't remember if it was for 
*swan, linux native implementation, or both.

>   2) linux packet sniffers (tcpdump, ethereal)

Packet sniffers always give you packets as they arrive from the wire, 
and as they leave to the wire, since they work by opening device 
directly.  So, in table 3-1 it would be part of step 2, in table 3-2 
part of step 8, and in table 3-3 part of steps 2 and 10.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

