From: Gadre Nayan <gadrenayan@gmail.com>
Subject: Ipset kernel module functions
Date: Tue, 23 Feb 2016 09:58:47 +0530
Message-ID: <CAKJ7aR5_xNAeDdnU53K4sVvOVzDTzBjYZ1yxJ7jX8cL=jCRBJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=yU/V4f6QG2LUfUVB9e5UJnjcwpInDv47Dq0uMY8c8nU=;
        b=i9/3QlOM6Q1vXIf1hgKBya6B4qIviysZQisL7TTDnU6yBbNCzBF8q2YmYXdd5WHiaF
         +ZpoucBp7UszB/TmL0YxbS3GSv7sHxKcUojmGrdRIwkWr/xY7+qlsj2Gm4qlCNsArrYP
         sv/o3Cw+0McHUdyBkKOpyxLfyiMvEWXuhammxsv7sdlqaNH9EmvoOZ7DyQ26B9sW57AP
         I3Dx5lL2kNchDed1Q2WAscDdsHil7koDdc76f91ns6h9da5MVditNj25v6jSQhH9e3hS
         yeZbUSflXwUkEBlY4xmW3wxlwO/dABUxA2MgzA0D0U/2JwrI9oh8PMwmSjvzZ1bnRsO8
         xCvQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear All,

I am trying to understand the IPSET modules in linux kernel 4.3.
Particularly Macset.
In the source file: /net/netfilter/ipset/ip_set_hash_mac.c

I have few questions:

1. What is the purpose of HTYPE, it is not getting used further.

/* Type specific function prefix */
         #define HTYPE           hash_mac

2. What is the purpose of MTYPE.
          #define MTYPE           hash_mac4

3. Why 2 different functions are used. KADT and UADT. I understand ADT
is Add delete, Test and K and U might be Kernel space and User space.
But what is different operation of KADT and UADT.

4. Who calls Kadt in kernel space. How is UADT called from User space.

Sorry for being too questioning here. I need some direction to
understand this further.

Thanks and Regards
Gadre Nayan
