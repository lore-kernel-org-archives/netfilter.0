From: "Paul Rice" <paul.rice@boomerang-networks.com>
Subject: NATed internal IP leaking
Date: Mon, 13 Apr 2009 11:49:13 -0500
Message-ID: <76F066FACCF040F783FA28B9230036C9@PaulPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi Guys,

I'm using kernel version 2.6.25.16 and attempted this on 2.6.29 as well.

I'm using ppp0 to connect to verizon wireless and when using Masquerade
NAT, I'm being told by verizon that my client IP's are coming across the
ppp0 interface and they are terminating the connection.  I have used 2.4
kernel doing the same thing with no issue like this.

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE is what I've used
with success in the past.

My question is: Is there a way to keep internal ip's from leaking?  I've 
experimented with dropping everything 192.168.0.0/24 on ppp0 interface but 
no joy.

Thanks,
Paul Rice

