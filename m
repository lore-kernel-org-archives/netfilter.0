From: J Doe <general@nativemethods.com>
Subject: Ampersand operator in wiki
Date: Fri, 4 Aug 2017 14:32:41 -0400
Message-ID: <1A9B1B26-731A-4FD6-B72A-8D0005296271@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a question regarding the ampersand operator as listed on the wiki at: wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes

	ip saddr & 0xff == 1

Is this performing an AND operation with saddr and 0xff and then comparing if the result is equal to 1 ?

	ip saddr & 0.0.0.255 < 0.0.0.127

I have no idea what this expression is doing.  A rough guess would be AND operation and left-shift or is this a form of range comparison ?

Thanks,

- J
