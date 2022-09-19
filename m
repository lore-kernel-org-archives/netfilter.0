From: grin <grin@grin.hu>
Subject: [doc?] nftables; symbolic variable definition only allows suffixed
 comments
Date: Mon, 19 Sep 2022 12:46:58 +0200
Message-ID: <20220919124658.27922d64@narya.grin.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grin.hu;
        s=foobar; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=giE0+BY7ef4hzvXFfpw+0xFde+RFf7Cpp0FzVuG8UmU=; b=TWw235cHepbSpXsZS3yDhUvlhq
        16CZ4B3Ilb1LuSlV1BkdU/D40sdachFzxSxFbfvlVmd/+TKhMvqDDG6t+0dLjtTjME2rQzbBF5+Uv
        EDW/88QasYNMUXNCBKJKZgRWvs6cvvSGnAq5S+YPBwR3kWKmo8RyefkWdC55+fb0Zv8nkjPUEOEL5
        Tmr0DSbdoX2aXuD8MPrOko8O492rBlZz4g5Qxf4JA1YiI1sab4WjhNKl0PqODETv8jAmscQ3uEoOH
        rXkmXSUCwcF1VqBpS+UqDfg+iIJu1HT1ZfiVgzhfGOtlS1jmQ14cjCUUwzX2jAa2kw2uQK5vTujL3
        yq4OMq2g==;
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I see no signs of this in neither the docs (manpages) nor the wiki: it seems that in variable definitions comments are only allowed as a line ending comment but not as a standalone one, contrary to the documentation:

# this is allowed
define meh = { 1.2.3.4, # this is allowed
# this is a syntax error
5.6.7.8 } 

I believe this is acceptable but the documentation shall reflect that.

g
