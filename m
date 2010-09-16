From: Alex Bligh <alex@alex.org.uk>
Subject: Ignore tcp checksum on ip_conntrack
Date: Thu, 16 Sep 2010 16:55:37 +0100
Message-ID: <1E6DC90B5FEECCA9D7482842@Ximines.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: Alex Bligh <alex@alex.org.uk>

ip_conntrack ditches packets for masquerading etc if their ip checksum
is wrong.

Is it possible to disable this behaviour on kernel 2.6.18 (I know, it's
old)? I have something that like producing tcp packets with invalid
checksums.

-- 
Alex Bligh
