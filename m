From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Restoring rulesets containing dynamic sets with counters
Date: Mon, 9 Mar 2020 19:35:15 -0400
Message-ID: <5e5cfaed-d2c6-02e1-8019-dd6ba2613034@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=rzJevRG8qJdPJX6rMJ/HpnuziXV0KxBRxHnKQZSFP4g=;
        b=ZtMIju/42ltheZwSL5kWBk13sFMtdfAY0VmMoRLDqYGZawkAGnRnz3EEHt8C+H7IL67lDbK4CTItsM5ZzLJYa1/8KfesuQF8dztvsAV2oh8wXcbN2ln7bA8hfov0NWwdQLGyg892mXjH94pWv6P1beGHy48Fs28ULSyBLhkeg9E=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I've created a ruleset that contains several dynamic sets with counters 
that are incremented from the packet path using rules like:
update @suspect { ip saddr counter }

After awhile in operation, "nft list ruleset" produces output like:
table ip ip_filter {
	set suspect {
		type ipv4_addr
		size 65535
		flags dynamic,timeout
		timeout 30d
		gc-interval 1d
		elements = { 1.2.3.4 expires 19d23h52m27s576ms counter packets 51 
bytes 17265 }
	}

But "nft -f" then chokes when loading the saved ruleset, with
"Error: syntax error, unexpected counter, expecting comma or '}'".

For now I can use sed to blank the counter text before reloading the 
ruleset (as after reboot). That's bit clunky, and obviously loses the 
counter values.

I do want to keep the dynamically-added elements across reboot. Is there 
a better way to do so?

Thanks,
Frank
