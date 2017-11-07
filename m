From: Tomas Mudrunka <mudrunka@spoje.net>
Subject: Counters for individual elements in maps and
 =?UTF-8?Q?sets=3F?=
Date: Tue, 07 Nov 2017 14:09:22 +0100
Message-ID: <869ba4d3be90adbb2519654c489285d0@spoje.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1510060179;
        bh=fBSI8p+WH8cVoCG2kfA8d81hMIxI31CY6zXJRlVWgpk=;
        h=Date:From:To:Subject:From;
        b=s7XO/kO1zMusuBMRNRyHIvO2sVfe0wO0OS9AHry/wd/+71yGl9gseoj97bNG/UwBe
         sUMvtuHqXiWbSEet1U5zpk0z1JWZk1dQ8Tvgg0kA6EGTw6oxVNA1I5souLIJ2D7aAq
         5C8XYoIRdP72cPECJsc3wM5JA8Rg1M8ObHOg9n3s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1510060162;
        bh=fBSI8p+WH8cVoCG2kfA8d81hMIxI31CY6zXJRlVWgpk=;
        h=Date:From:To:Subject:From;
        b=ga/Vs3G9bEAkaXo8wJz3EqLdIPgxRU2HEuyWz7rnXXYkAmMhsUDsLgOBYDZ9oytrj
         LTuvnSVcdVlJMO6yEFRv31reIPhLW7+s42JYUe52uRF+5MSkTorYyQ47QArXAI6a4j
         2Z3/thd4rzNbVIizy6J0SYw4MS52JQqRCNuitUTQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hello,
i've figured it's possible to simplify my rules by using maps and sets 
instead of using individual rules, but i need to account traffic for 
each address in the map separately. Maybe this can be implemented using 
flags in map/set, so i will be able to enable it like this:

	map prometheus {
		type ipv4_addr : classid;
		flags interval, counter;
		elements = {
			1.1.1.2 : 2:2222 counter packets 10 bytes 5120,
			1.1.1.3 : 3:3333 counter packets 3 bytes 489
		}
	}

just to make it clear, the same map without counters looks like this 
right now:

	map prometheus {
		type ipv4_addr : classid
		flags interval
		elements = {
			1.1.1.2 : 2:2222,
			1.1.1.3 : 3:3333
		}
	}


Will it be ever possible to have per element counters for maps and sets?

Thanks

-- 
S pozdravem
Best regards
      Tomáš Mudruňka - SPOJE.NET s.r.o.
