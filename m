From: "john bowers" <johnkbowers@hotmail.com>
Subject: RE:Nat/router problem
Date: Wed, 24 Mar 2004 03:56:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F1180J64TBU25J00001c00@hotmail.com>
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

Well I think I've solved my problem that I enquired about earlier. 
Apparently the rule wich wouldn't let me do anything out the back interface 
of my Masquerading Nat/router was  the one " iptables -t nat --policy 
POSTROUTING DROP" . I just changed the drop to ACCEPT and everything seems 
to work fine. I will defineatly audit it from the front side to make sure 
though.

Sorry about the crap appended to my emails, I use hotmail and it looks as if 
they add links on to you email to sell stuff. Oh, well I guess I get what I 
pay for.

_________________________________________________________________
Check out MSN PC Safety & Security to help ensure your PC is protected and 
safe. http://specials.msn.com/msn/security.asp


