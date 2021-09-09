From: Fatih USTA <fatihusta86@gmail.com>
Subject: nft set type list
Date: Thu, 9 Sep 2021 18:39:00 +0300
Message-ID: <c2c8c1f2-05f0-be0d-0bc4-3f4ca23cc57d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=Shx0qZOy5g+t/6a9pKGJ9MVphodIQZ2rAUdGNz7PjuE=;
        b=at1x6lT+jZ2xgHNLAhKV5V/u4T28MzHNu+o11ll/nleEdZAaYAEkEgvD13ZUqC9nKl
         CVbl0heVaCb5muovCTzm6dl9R8QClwjhvP+ol6cJ3vnr6bNE6iFfazrFMsoJCt4toNo1
         oU4Hcomf8yhr8ovqBZpwZT3+TEI6a6uqFh4gkC1QG3sRX6HQsGpAejrCjGi3ar6l+1gp
         BdEokkNMqcWnOSMt4VBlKXCXO3sQHxHfLNjUTd40jypP1qgRXiivugAcSnP1ORvm7HjG
         RYNTk2zJzI/hgU4jA3jLtLvZRFmkrVyg9hEirelIwIdol/lSpGM0zATX3vy/Bub6F3qW
         7INQ==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi,

I'm searching like "ipset list:set" type functionality for nft. I 
couldn't find any documentation. I tried to translate with 
"ipset-translate".

Here ise return.

ipset-translate restore <<EOF
create test list:set
EOF
add table inet global
add set inet global test { type unknown; }

Is there any other way for this?

Thanks

--
Fatih USTA

