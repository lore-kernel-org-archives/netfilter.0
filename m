From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 22:02:41 -0400
Message-ID: <20210628220241.64f9af54@playground>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
        <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
        <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
        <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
        <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
        <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
        <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
        <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
        <20210628104310.61bd287ff147a59b12e23533@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.wpi.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxqEMlHI93HrYORHlhS1Gc8VwRsS4LvGj4Brh6RyWbg=;
 b=nXoKm2B9zMNNkKTcQYnj0E/lEuP7rvX6Zk75OmroyCBivfNlvBkjm9PODkH7yKqK2ywlyCo8b8AXU2DVE1kAkRPk5ZXDiVpeE2SE2vvrgYr7pE+hVaC9f0KN0sk74xZB2AkJ4F8OU4fiVInaNW9gd869Cqblpr6DuR+gq+JvMxA=
In-Reply-To: <20210628104310.61bd287ff147a59b12e23533@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Mon, 28 Jun 2021 10:43:10 +0100
Kerin Millar <kfm@plushkava.net> wrote:

> Now you benefit from atomicity (the rules will either be committed at once, in full, or not at all) and proper error handling (the exit status value of iptables-restore is meaningful and acted upon). Further, should you prefer to indent the body of the heredoc, you may write <<-EOF, though only leading tab characters will be stripped out.
> 

[minor digression]

Is iptables-restore truly atomic in *all* cases? Some years ago, I found through experimentation that some rules were 'lost' when restoring more than 25 000 rules. If I placed a COMMIT every 20 000 rules or so, then all rules would be properly loaded. I think COMMITs break atomicity. I tested with 100k to 1M rules. I was comparing the efficiency of iptables-restore with another tool that read from STDIN; the other tool was about 5% more efficient.
