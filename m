From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: ebtables VLAN filtering
Date: Mon, 07 Feb 2011 01:43:31 +0000
Message-ID: <4D4F4E43.6090000@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

With ebtables, is it possible to filter via the VLAN interface (e.g. 
eth0.3 for VLAN3) using the normal -i and -o parameters? I'd like to 
filter via the interface rather than using the tag with --vlan-id if 
possible

Thanks
