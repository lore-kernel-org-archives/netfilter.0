From: Daniel Huhardeaux <tech@tootai.net>
Subject: Re: nft - execute command without returning error
Date: Sun, 13 Oct 2019 14:52:35 +0200
Message-ID: <aabc2650-b486-1f8b-05a6-58731081ab01@tootai.net>
References: <74e77ccc-f437-6368-37b6-72fdd102ea9a@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1570971156; bh=ooqX6izZIPbckdDTEU2w/fMygV27FwZUGxbYyhDI3Y8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=V6s2lU42UnY0nsM8uSBGTftT8AbZt0mwiD9W+cImNq2aUO8YuG/LqTGqvcvxlodqt
         +fVupkoLcqcmm+dGDHLaEL5ZolOdBEz80HvvXInxL2eOTNY9dqHOOBjYBdaYLSLxGp
         woKeZ5k77Dw0ER/oturxrrtJW4Y1gCOwMgv8l7y8=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1570971156; bh=ooqX6izZIPbckdDTEU2w/fMygV27FwZUGxbYyhDI3Y8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=V6s2lU42UnY0nsM8uSBGTftT8AbZt0mwiD9W+cImNq2aUO8YuG/LqTGqvcvxlodqt
         +fVupkoLcqcmm+dGDHLaEL5ZolOdBEz80HvvXInxL2eOTNY9dqHOOBjYBdaYLSLxGp
         woKeZ5k77Dw0ER/oturxrrtJW4Y1gCOwMgv8l7y8=
In-Reply-To: <74e77ccc-f437-6368-37b6-72fdd102ea9a@tootai.net>
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Le 12/10/2019 à 22:32, Daniel Huhardeaux a écrit :
> Hello,
> 
> for instance, I want to delete a table which is not existing. Problem is 
> that nft return an error and stop processing the script. It's the same 
> for other commands like adding an already existing chain.

Sorry for this, I saw it's not true as in chain I can use add instead of 
create to avoid error.

To be clear, my goal is to use nft instead of bash to create rules: bash 
script is used to set automatically some values like ip/ipv6 addresses 
aso, echo them in a define include file and chain to nft script who will 
include this file and apply rules.

-- 
Daniel
