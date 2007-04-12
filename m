From: "Michael Ransburg" <michael.ransburg@gmail.com>
Subject: Using Netfilter to modify the payload of an IP packet?
Date: Thu, 12 Apr 2007 11:42:58 +0200
Message-ID: <22b256140704120242q112719dcid2a129068038c665@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=UjhGeoNCxOgNOLP6q0v/0turQqAKzPxQ5ZUKyg2qOR2oDPn5fTkvhEVFZl4EhyJJTrTVqD8R5pCDSTIyh0ygopASw9/gvvd4/QITIgjyOij7BLWGl+E1IMjs7hewPvil82ZCBhIsxvkhdVZ5Lp8ngI5c3R5tyzbyzY0gqxcBf9w=
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

I currently use the "winpkfilter" framework (www.ntkernel.com) on
Windows to discard parts of the payload of IP packets transparently to
the sender and receiver. I.e., I use the promiscious mode to
accomplish this on a computer B while the packets go from computer A
to computer C.

For this I need to:
1) Capture all ethernet frames which belong to a certain IP packet
2) Reassemble the payload of the IP packet from all the ethernet frame payloads
3) Remove parts of this payload according to my appliation
4) Update TCP/IP headers (length, checksums, ...)
5) Refragment the modified payload into ethernet frames
6) Send the ethernet frames to their original destination

As you can see, this is quite complex since the winpkfilter framework
is based on capturing ethernet frames.

I'm now investigating netfilter for the tasks outlined above and I
have two questions:

1) Can the actions described above be performed using a linux based
netfilter framework?

2) Will using the netfilter framework make my life easier, i.e., are
for example modifications of the payload based on IP level possible
(which would already take some complexity out of my appliation).

Any further hints / pointers which you can provide are highly appreciated.

Many thanks,
Michael
-- 
icq: 71772353 | skype: daneel1409 | msn: mike@unfolded.com

