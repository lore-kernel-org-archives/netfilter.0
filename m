From: "dawn lin" <alantisjun@hotmail.com>
Subject: help
Date: Thu, 05 Jun 2003 17:19:10 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY7-F73hQYZkxOjmfC0003fd2e@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

i have 3 computers A, B and C.
i need A to talk to C through B(not a router)

I was hoping iptables will help me do mac filtering.

is it possible?

What i need is A is able to talk B only and B is to resend A's message to B.
Which is in a way where A wants to talk to C but it can only go through B to 
talk to C.
Can anyone advice me how i can use iptables for that?

one senerio:
A send packets to C-> packet info shows MAC source=A, MAC dest=B,IP 
source=A,IP dest=C
When packet reaches B-> packet info shows MAC source=B,MAC dest=C,IP 
source=A,IP dest=C

is that possible?

_________________________________________________________________
Download Norah Jones, Eminem and more! http://www.msn.com.sg/ringtones/


