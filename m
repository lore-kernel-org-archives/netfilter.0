From: Philip Craig <philipc@snapgear.com>
Subject: Re: Transparent proxying using REDIRECT
Date: Thu, 17 Jul 2003 17:35:49 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F1651D5.5060708@snapgear.com>
References: <4.2.2.20030717085400.00cb6ac0@vttmail.vtt.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4.2.2.20030717085400.00cb6ac0@vttmail.vtt.fi>
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
To: Mikko Alutoin <mikko.alutoin@vtt.fi>
Cc: netfilter@lists.netfilter.org

Mikko Alutoin wrote:
> How does the proxy get to know the original destination IP address and 
> port? By looking into the HTTP-request, perhaps? If so, what if the 
> application protocol (some other than HTTP) does not contain the 
> destination URL?

Use SO_ORIGINAL_DST, for example:

getsockopt(fd, SOL_IP, SO_ORIGINAL_DST, &dst_addr, &addrlen);

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


