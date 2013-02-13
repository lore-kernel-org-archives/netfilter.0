From: Daniel Reurich <daniel@centurion.net.nz>
Subject: nf_nat_sip with CT target
Date: Thu, 14 Feb 2013 11:41:58 +1300
Message-ID: <511C16B6.3000607@centurion.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm having trouble figuring out how to set up nf_nat_sip when using the 
CT target for loading nf_conntrack_sip.

The CT target for sip works fine.

What I'm struggling with is finding any documentation that indicates how 
to add the fucntion of nf_nat_sip as well.

Do I still need to manually load the nf_nat_sip module or can it be 
loaded by the conntrack helper or some similar method?

Thanks and regards,
	Daniel


-- 
Daniel Reurich
Centurion Computer Technology (2005) Ltd.
021 797 722
