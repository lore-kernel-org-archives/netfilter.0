From: "will_u_tellmemore will_u_tellmemore" <will.u.tellmemore@gmail.com>
Subject: Fwd: using netfilter for implementing ft-fcp
Date: Wed, 1 Nov 2006 18:45:21 +0530
Message-ID: <97993dc40611010515p4b04bd35l9ec2c66e558bff5c@mail.gmail.com>
References: <97993dc40610300239xbd3f40qb33831e95f83aa86@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <97993dc40610300239xbd3f40qb33831e95f83aa86@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,
I am not very sure if this is the right mailing list to post this
question . Point me to correct one if this is wrong ..

I am trying to implement Fault tolerant TCP as explained in

 http://citeseer.ist.psu.edu/alvisi00wrapping.html

While looking for some information regarding how to implement this , i
came across netfilter framework.
I am new to linux world so i would like to have some help about this
before i proceed.
 The idea in paper is to implement a kernel module which will
intercept all the packets coming to server tcp and log them to stable
buffer.If server crashes , then replay these logs. Also to handle
client connection correctly ,it intercepts all outgoing packets and
modifies the sequence number and thus the "segment"  depending upon
the packet's state in stable buffer( i.e. commited /no ).

So i was wondering ,is netfilter the right choice to about it ?? or
does it intercept packet below IP layer (in PRE_ROUTING)  ??
Is thr a way to sit between TCP and IP protocol implementation and
intercept all the communication between them ??


What is  the other way to achieve this if not netfilter framework ??

Any help in this regard is highly appreciated  ...

Regards,
TellMeMore

