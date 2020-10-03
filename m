From: Emilio Augusto Lazo Zaia <emiliolazozaia@gmail.com>
Subject: end iptables support
Date: Sat, 3 Oct 2020 01:40:08 -0400
Message-ID: <660c1cff-64a9-13d3-e219-713d0cd44bd8@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=D/RamriyqZSRj6hOzAZAMErK+Qp3SuCOKYZhheDs1rE=;
        b=fMuthv7CLVLjqWu/5JF8D8KT42IQeeySi2My8Cp9/EjeIS567Wr//OVRtJMGPDdfpn
         rwihX0qbP/6NNJUHjqvIQHxBsUPbRGQJYNDh5ORZ9VdWpbeBo41cV4yQCHCWF8XIWGRp
         Dma1YU5cNIWjjdjkEZaX3O3m//5eEVTD6y4XsWOUf1Q3U9VU6dx47g2RI3GIBbZk3/W6
         oK7EMBTtCeKnnzffzUfKAb3Zpl4+wFD12IXxK9VDQN+tJjL06H7biJnHrNar3Qn5C/WS
         FcHWinYQUjU5EmYBvnnFfnZuD31XSJGETFWYGlsk/HQwBFLXIImeCYzuLRJX8IiyrCg5
         h41w==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello

When is supposed to be dropped the iptables support in Linux kernel in favor of nft? Currently I'm using iptables in many servers!

-- 
Emilio Augusto Lazo Zaia

