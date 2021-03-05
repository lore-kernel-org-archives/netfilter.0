From: Frank Myhr <fmyhr@fhmtech.com>
Subject: nft_set_type
Date: Fri, 5 Mar 2021 18:21:33 -0500
Message-ID: <7a0d19dd-ecd3-26da-f3ac-ec2242e497b0@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=KQQ+p6oOlFAn4IuXafN8UkQs5ymS0hQ2ocmIxodSsbA=;
        b=BSiLgVXEAH0UQjc6ddQ1Z0xXnB2wEycxm8WPje3kUT5lP+PhA7WYmkWL8a21F63qi/UeAQRVIfgD50CXiHnnwfrY7h1j9jg5V/WtROUupg3NVq/5Etm0JC79be6hNSKHc/ea40X7a9UTs5Jfu8wSQmXj6PyIW8zx7w2oL2U27aY=;
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Is there a way to get nft to show what nft_set_type has been used for a 
given set?

Context: I'm attempting to improve my understanding of nftables sets, 
and have begun:

https://wiki.nftables.org/wiki-nftables/index.php/Portal:DeveloperDocs/set_internals

(which I've not linked from other pages because it's still a WIP).

Thanks,
Frank
